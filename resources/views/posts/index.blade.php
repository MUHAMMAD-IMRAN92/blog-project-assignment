@extends('layouts.admin_layout')

@section('content')
<div class="">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <h1>Posts</h1>
        </div>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row mt-4">
                <div class="col-12">
                    @if (session()->has('msg'))
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <span class="badge badge-pill badge-success">Success</span>{{ session()->get('msg') }}
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    @endif

                    <!-- Add Post Button -->
                    <div class="mb-4">
                        <a href="{{ url('posts/create') }}" class="btn btn-primary">Add New Post</a>
                    </div>

                    <!-- Display posts as Bootstrap cards -->
                    <div class="row">
                        @forelse ($posts as $post)
                        <div class="col-md-4">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <h5>{{ $post->title }}</h5>
                                </div>
                                <div class="card-body">
                                    <p>{{ Str::limit($post->content, 100) }}</p>
                                    <a href="{{ route('posts.show', $post->id) }}" class="btn btn-info">View Details</a>
                                </div>
                            </div>
                        </div>
                        @empty
                        <div class="col-12">
                            <p>No posts available.</p>
                        </div>
                        @endforelse
                    </div>

                    <!-- Pagination -->
                    <div class="d-flex justify-content-center">
                        {{ $posts->links() }}
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- /.content -->
</div>
@endsection
