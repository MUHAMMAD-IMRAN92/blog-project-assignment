<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    use HasFactory;
    protected $fillable = ['content', 'user_id', 'post_id', 'parent_id'];

    public function post()
    {
        return $this->belongsTo(Post::class);
    }

    // Relationship to get the user who made the comment
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    // Each comment can have many replies (child comments)
    public function replies()
    {
        return $this->hasMany(Comment::class, 'parent_id');
    }

    // A comment may have a parent comment
    public function parent()
    {
        return $this->belongsTo(Comment::class, 'parent_id');
    }

}
