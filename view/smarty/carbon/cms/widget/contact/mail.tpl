{extends 'mail/index'}

{block 'body_content'}
	<p>{"`$data['name']` <`$data['email']`>"|escape}</p>
    <p>{$data['message']}</p>
{/block}

{block 'body_data'}{/block}