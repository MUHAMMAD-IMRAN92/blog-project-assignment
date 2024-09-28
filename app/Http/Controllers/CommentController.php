<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use Illuminate\Http\Request;

class CommentController extends Controller
{
    public function store(Request $request)
    {
        $request->validate([
            'content' => 'required',
            'post_id' => 'required|exists:posts,id'
        ]);

        Comment::create([
            'content' => $request->content,
            'post_id' => $request->post_id,
            'user_id' => auth()->id() ?? null // Nullable for guest comments
        ]);

        return back()->with('msg', 'Comment added successfully!');
    }
    public function reply(Request $request, Comment $comment)
    {
        $request->validate([
            'content' => 'required',
        ]);

        $reply = new Comment([
            'content' => $request->content,
            'user_id' => auth()->id() ?? null,
            'parent_id' => $comment->id,
            'post_id' => $comment->post_id,
        ]);

        $reply->save();

        return back()->with('msg', 'Reply added successfully!');
    }
}
