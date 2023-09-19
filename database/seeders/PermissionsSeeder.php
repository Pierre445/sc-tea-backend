<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class PermissionsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //Reset cached roles and permissions
        app()[
        \Spatie\Permission\PermissionRegistrar::class
        ]->forgetCachedPermissions();

        // create permissions
        $arrayOfPermissionNames = [
            //Products
            "access products",
            "create products",
            "update products",
            "delete products",
            //Users
            "access users",
            "create users",
            "update users",
            "delete users",
        ];
        $permissions = collect($arrayOfPermissionNames)->map(function ($permission){
            return ["name"=>$permission, "guard_name" => "web"];
        });

        Permission::insert($permissions->toArray());

        //create role & give it permissions
        Role::create(["name"=>"admin"])->givePermissionTo(Permission::all());
        Role::create(["name"=>"customer"])->givePermissionTo(['create products','update users']);

        //Assign roles to users (in this case for user id -> 1,2 & 3)
        User::find(1)->assignRole('admin');
        User::find(2)->assignRole('customer');
        User::find(3)->assignRole('customer');
    }
}
