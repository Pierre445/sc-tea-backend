<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Products;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ProductsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $product = Products::all();
        return $product;
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $product=new Products();
        $product->create([
            'ProductName'=>$request->ProductName,
            'price'=>$request->price,
            'ref' =>$request->ref,
            'category'=>$request->category,
            'description'=>$request->description,
            // 'urlProduct'=> Storage::disk('public')->put('',$request->urlProduit)
        ]);

        $all = Products::all();
        return $all;
    }

    /**
     * Display the specified resource.
     */
    public function show($products)
    {
        $product = Products::findorfail($products);

        return $product;
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request,$products)
    {
        $product = Products::findOrFail($products);

        //dd($produit);
        $product->update([
            'ProductName' => $request->ProductName,
            'price' => $request->price,
            'ref' => $request->ref,
            'category' => $request->category,
            'description'=> $request->description,
            'urlProduct'=> Storage::disk('public')->put('',$request->urlProduit)
        ]);
        $updateProducts = Products::findorfail($products);
        return $updateProducts;
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy( $products)
    {
        $produit = Products::findorfail($products);
        $produit->delete();

        $produits = Products::all();
        return $produits;
    }
}
