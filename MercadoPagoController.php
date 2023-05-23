<?php

namespace Pterodactyl\Http\Controllers\Base;

use MercadoPago\SDK;
use MercadoPago\Payment;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Pterodactyl\Models\User;
use Pterodactyl\Http\Controllers\Controller;

class MercadoPagoController extends Controller
{
    public function index(Request $request): Response
    {
        try {
            // Captura o ID da transação do POST
            $data = $request->getContent();
            $notificationId = $request->input('id') ?? $request->input('data.id') ?? $request->input('payment_id');
            \Log::error('Mercado Pago (BASE IPN): ' . $notificationId . $data);

            $status_type = $this->privateCheck($notificationId); //Inicia Processo de Pagamento.
        } catch (\Exception $e) {
            \Log::error('Erro Mercado Pago (BASE IPN): ' . $e->getMessage());
            $status_type = 400; // Seta Status 400 para erro ao processar o status
        }

        return new Response('Algo que ainda não sei', $status_type);
    }

    private function privateCheck($notificationId): string
    {
        try {
            SDK::setAccessToken(config('gateways.mpago.access_token'));

            $payment = Payment::find_by_id($notificationId);
            \Log::error($payment);

            // Pega as informações do pagamento e seta elas em variantes.
            $status = $payment->status ?? 'indefinido';
            if ($status == 'indefinido') {
                $status_type = 200;
            } else {

                Log::error($status);
                $metadata_json = $payment->metadata;
                $metadata = json_decode($metadata_json);
                $userId = $metadata->user_id;
                $creditAmount = $metadata->credit_amount;

                if ($status == 'created') {
                    $status_type = 201;
                }

                if ($status == 'pending') {
                    $status_type = 200;
                }

                if ($status == 'approved') {
                    $bal = User::query()->select('store_balance')->where('id', '=', $userId)->first()->store_balance;
                    User::query()->where('id', '=', $userId)->update(['store_balance' => $bal + $creditAmount]);
                    $status_type = 200;
                }
            }

        } catch (\Exception $e) {
            \Log::error('Erro Mercado Pago (BASE IPN): ' . $e->getMessage());
            $status_type = 400; // Seta Status 400 para erro ao processar o status
        }

        return $status_type;
    }
}
