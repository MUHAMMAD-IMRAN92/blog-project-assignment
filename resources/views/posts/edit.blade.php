@extends('layouts.admin_layout')
@section('content')
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                {{-- <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>DataTables</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">DataTables</li>
                    </ol>
                </div>
            </div> --}}
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row mt-4">
                    <!-- left column -->
                    <div class="col-md-12">
                        <!-- general form elements -->
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Edit Inventory System</h3>
                            </div>
                            @if ($InventorySystemAccess)
                                <form action="{{ url('company_inventory_systems/update/'.$InventorySystemAccess->id) }}"
                                method="POST">
                                @method('PUT')
                                @else
                            <form action="{{ route('company_inventory_systems.store') }}"
                                method="POST">
                            @endif
                                @csrf

                                <div class="card-body">
                                    <div class="row d-flex">
                                        <div class="form-group col-md-12">
                                            <label for="exampleInputEmail1">Inventory System</label>
                                            <div class="row">
                                                <select name="type" id="systems-dropdown-id" class="form-control" readonly>
                                                    <option value="0">Select Type</option>
                                                    @foreach ($systems as $system)
                                                        <option value="{{ $system->id }}" data-name="{{ $system->title }}"
                                                         {{ $inventory_system->system_id = $system->id ? 'selected' : '' }}>
                                                            {{ $system->title }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                        <div id="netsuite-form" class=" col-12">
                                            <div class="form-group col-12">
                                                <input type="hidden" name="id" class="form-control"
                                                value="{{ $InventorySystemAccess->id ?? '' }}"
                                                placeholder="">
                                                <label for="exampleInputEmail1">Customer Key</label>
                                                <input type="hidden" name="company_id" class="form-control"
                                                    value="{{ $inventory_system->company_id ?? '' }}"
                                                    placeholder="">
                                                <input type="text" name="customer_key" class="form-control"
                                                    value="{{ $InventorySystemAccess->customer_key ?? '' }}"
                                                    placeholder="">
                                            </div>
                                            <div class="form-group col-12">
                                                <label for="exampleInputEmail1">Customer Secret</label>
                                                <input type="text" name="customer_secret" class="form-control"
                                                    value="{{ $InventorySystemAccess->customer_secret ?? '' }}"
                                                    placeholder="">
                                            </div>

                                            <div class="form-group col-12">
                                                <label for="exampleInputEmail1">Access Token</label>
                                                <input type="text" name="access_token" class="form-control"
                                                    value="{{ $InventorySystemAccess->access_token ?? '' }}"
                                                    placeholder="">
                                            </div>
                                            <div class="form-group col-12">
                                                <label for="exampleInputEmail1">Token Secret</label>
                                                <input type="text" name="token_secret" class="form-control"
                                                    value="{{ $InventorySystemAccess->token_secret ?? ''}}"
                                                    placeholder="">
                                            </div>
                                            <div class="form-group col-12">
                                                <label for="exampleInputEmail1">Account Secret</label>
                                                <input type="text" name="account_name" class="form-control"
                                                    value="{{ $InventorySystemAccess->account_name ?? '' }}"
                                                    placeholder="">
                                            </div>
                                        </div>

                                    </div>

                                    <div class="card-footer">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                            </form>
                        </div>
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
@endsection
