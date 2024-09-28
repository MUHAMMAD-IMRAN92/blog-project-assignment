<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class BaseController extends Controller
{
    //
    public function success($data, $message)
    {
     $response = [
            'success' => true,
            'data'    => $data,
            'message' => $message,
        ];
        return response()->json($response, 200);
    }
    public function error( $message)
    {
     $response = [
            'success' => false,
            'message' => $message,
        ];
        return response()->json($response, 404);
    }
}
