{extends 'mail/index'}

{block 'body_content'}
    {url id='profile.password.reset' parameters=['user' => $encryptedUsername, 'time' => $encryptedTime] var='url'}

    <p>{'label.security.mail.hello'|translate} {$user->getDisplayName()},</p>

    <p>
    	{'label.security.mail.link'|translate}<br/>
    	<a href="{$url}">{$url}</a>
    </p>
{/block}

{* Don't show data block *}
{block 'body_data'}{/block}