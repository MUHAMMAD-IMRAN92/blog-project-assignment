<?php

use App\Http\Controllers\PostController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CommentController;
use Illuminate\Support\Facades\Auth;



Auth::routes();

Route::get('/', [PostController::class, 'index'])->name('posts.index');

Route::middleware(['auth'])->group(function () {
    Route::get('posts/create', [PostController::class, 'create'])->name('posts.create');
    Route::post('posts', [PostController::class, 'store'])->name('posts.store');
});

Route::get('posts/{post}', [PostController::class, 'show'])->name('posts.show');

Route::post('posts/{post}/comments', [CommentController::class, 'store'])->name('comments.store');
Route::post('comments/{comment}/reply', [CommentController::class, 'reply'])->name('comments.reply');

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
