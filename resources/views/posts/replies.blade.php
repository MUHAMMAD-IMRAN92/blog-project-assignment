@foreach($comments as $comment)
    <div class="media mt-3">
        <img class="mr-3 rounded-circle" src="https://via.placeholder.com/50" alt="User Avatar">
        <div class="media-body">
            <h6 class="mt-0">{{ $comment->user->name ?? 'Anonymous' }}</h6>
            <p>{{ $comment->content }}</p>
            <small class="text-muted">{{ $comment->created_at->diffForHumans() }}</small>

            <!-- Reply button -->
            <button class="btn btn-sm btn-link" data-toggle="collapse" data-target="#replyForm-{{ $comment->id }}" aria-expanded="false" aria-controls="replyForm-{{ $comment->id }}">Reply</button>

            <!-- Reply form for nested replies (collapsed by default) -->
            <div class="collapse" id="replyForm-{{ $comment->id }}">
                <form action="{{ route('comments.reply', $comment->id) }}" method="POST">
                    @csrf
                    <div class="form-group">
                        <textarea name="content" class="form-control" rows="2" placeholder="Write a reply..." required></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary btn-sm">Submit Reply</button>
                </form>
            </div>

            <!-- Display replies recursively -->
            @if ($comment->replies->count() > 0)
                <div class="ml-4">
                    @include('posts.replies', ['comments' => $comment->replies])
                </div>
            @endif
        </div>
    </div>
@endforeach
