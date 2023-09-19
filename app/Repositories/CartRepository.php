<?php

namespace App\Repositories;

use App\Models\Products;

class CartRepository
{
    /**
     * Add product to cart 
     */
    public function add(Products $produit)
    {
        \Cart::session(auth()->user()->id)->add(array(
            'id'=>$produit->id,
            'name'=>$produit->ProductName,
            'price'=>$produit->price,
            'quantity'=>1,
            'attributes'=>array(),
            'associatedModel'=>$produit,
        ));
       
        return $this->count();
    }
    /**
     * Retrieves the contents of the cart
     */
    public function content()
    {
        return \Cart::session(auth()->user()->id)->getContent();
    }
    /**
     * Increase the content of the cart
     */
    public function increase($id){
        \Cart::session(auth()->user()->id)
            ->update($id, [
                'quantity' => +1
            ]);
    }
    /**
     * Decrease the content of the cart 
     */
    public function decrease($id){

        $item = \Cart::session(auth()->user()->id)->get($id);

        if($item->quantity == 1){
        $this->remove($id);
            return;
        }

        \Cart::session(auth()->user()->id)
            ->update($id, [
                'quantity' => -1
            ]);
    }
    /**
     * Remove the content of the cart
     */
    public function remove($id)
    {
        \Cart::session(auth()->user()->id)->remove($id);

    }
    /**
     * Return the quantity of the cart 
     */
    public function count()
    {
        if (Products::all()->first()) {
           
            return $this->content()->sum('quantity');
                
        }

        return $this->content();
    }
}
