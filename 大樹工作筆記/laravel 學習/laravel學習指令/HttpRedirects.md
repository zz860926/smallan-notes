https://laravel.com/docs/6.x/redirects

## Redirecting With Flashed Session Data

Redirecting to a new URL and flashing data to the session are usually done at the same time. Typically, this is done after successfully performing an action when you flash a success message to the session. For convenience, you may create a RedirectResponse instance and flash data to the session in a single, fluent method chain:

```php
Route::post('user/profile', function () {
    // Update the user's profile...

    return redirect('dashboard')->with('status', 'Profile updated!');
});
```
After the user is redirected, you may display the flashed message from the session. For example, using Blade syntax:
```php
@if (session('status'))
    <div class="alert alert-success">
        {{ session('status') }}
    </div>
@endif
```