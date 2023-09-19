<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\PersonnalInformation;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PersonnalInformationController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $userInformation = PersonnalInformation::all();
        return $userInformation;
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $userInformation = new PersonnalInformation();
        $userInformation->create([
            'company'=>$request->company,
            'adresse'=>$request->adresse,
            'postalCode'=>$request->postalCode,
            'city'=>$request->city,
            'phoneNumber'=>$request->phoneNumber,
            //A remplacer par l'ID de l'utilisateur connecté
            'userId'=> 1
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $data = PersonnalInformation::findorfail($id);
        return $data;
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $data = PersonnalInformation::findorfail($id);
        $data->update([
            'company'=>$request->company,
            'adresse'=>$request->adresse,
            'postalCode'=>$request->postalCode,
            'city'=>$request->city,
            'phoneNumber'=>$request->phoneNumber,
            //A remplacer par l'ID de l'utilisateur connecté
            'userId'=> 1
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $data = PersonnalInformation::findorfail($id);
        $data->delete();
    }
}
