@extends('layouts.admin_layout')

@section('content')
<div class="">
    <section class="content-header">
        <div class="container-fluid">
            <h1>{{ $post->title }}</h1>
        </div>
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="row mt-4">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h2>{{ $post->title }}</h2>
                            <small>Published on {{ $post->created_at->format('M d, Y') }}</small>
                        </div>
                        <div class="card-body">
                            <p>{{ $post->content }}</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Comments Section -->
            <div class="row mt-4">
                <div class="col-12">
                    <h3>Comments</h3>

                    <!-- Display each comment -->
                    @forelse ($post->comments as $comment)
                    <div class="media mb-4">
                        <img class="mr-3 rounded-circle" src="https://via.placeholder.com/50" alt="User Avatar">
                        <div class="media-body">
                            <h5 class="mt-0">{{ $comment->user->name ?? 'Anonymous' }}</h5>
                            <p>{{ $comment->content }}</p>
                            <small class="text-muted">{{ $comment->created_at->diffForHumans() }}</small>

                            <!-- Reply button -->
                            <button class="btn btn-sm btn-link" data-toggle="collapse" data-target="#replyForm{{ $comment->id }}" aria-expanded="false" aria-controls="replyForm{{ $comment->id }}">Reply</button>

                            <!-- Reply form (collapsed by default) -->
                            <div class="collapse" id="replyForm{{ $comment->id }}">
                                <form action="{{ route('comments.reply', $comment->id) }}" method="POST">
                                    @csrf
                                    <div class="form-group">
                                        <textarea name="content" class="form-control" rows="3" placeholder="Write a reply..." required></textarea>
                                    </div>
                                    <button type="submit" class="btn btn-primary btn-sm">Submit Reply</button>
                                </form>
                            </div>

                            <!-- Recursive Nested comments (replies) -->
                            @if ($comment->replies->count() > 0)
                                <div class="ml-4">
                                    @include('posts.replies', ['comments' => $comment->replies])
                                </div>
                            @endif
                        </div>
                    </div>
                @empty
                    <p>No comments yet.</p>
                @endforelse


                    <!-- Add a new comment -->
                    <div class="card mt-4">
                        <div class="card-body">
                            <h4>Leave a Comment</h4>
                            <form action="{{ route('comments.store' , $post ) }}" method="POST">
                                @csrf
                                <input type="hidden" name="post_id" value="{{ $post->id }}">
                                <div class="form-group">
                                    <textarea name="content" class="form-control" rows="3" placeholder="Write a comment..." required></textarea>
                                </div>
                                <button type="submit" class="btn btn-primary">Submit Comment</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
@endsection
