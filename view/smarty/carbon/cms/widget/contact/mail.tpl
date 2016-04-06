{extends 'mail/index'}

{block 'body_content'}
	{$data['name']}
	{$data['email']}
    {$data['message']}
{/block}

{block 'body_data'}{/block}