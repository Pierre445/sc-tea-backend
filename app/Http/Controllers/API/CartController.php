<?php

namespace App\Http\Controllers\API;

use App\Models\Products;
use Illuminate\Http\Request;
use App\Repositories\CartRepository;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class CartController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $cartContent = (new CartRepository())->content();
        $cartCount = (new CartRepository())->count();

        //At least one db product is required to execute
        if (Products::all()->first()){

        return response()->json([
            'cartContent' => $cartContent,
            'cartCount' => $cartCount
        ]);}

        else
        return null;
    }


    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $produit = Products::where('id', $request->productId)->first();
        $count = (new CartRepository())->add($produit);

        return response()->json([
        'count' => $count
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        if($request->id && $request->quantity){
            $cart = session()->get('cart');
            $cart[$request->id]["quantity"] = $request->quantity;
            session()->put('cart', $cart);
            session()->flash('success', 'Cart updated successfully');
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    /**
     * @return JsonResponse
     */
    public function count(){
        $count = (new CartRepository())->count();

        return response()->json([
            'count' => $count
        ]);
    }
}
