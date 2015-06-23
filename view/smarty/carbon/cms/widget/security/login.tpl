{* widget: login; action: index; translation: widget.login *}

{include file="cms/helper/form.prototype"}

<div class="block" id="widget-{$app.cms.widget}">
    <form id="{$form->getId()}" class="form" action="{$action}{if $referer}?referer={$referer|urlencode}{/if}" method="POST" role="form">
        {call formRows form=$form}

        {call formActions submit="button.login"}
    </form>

    {if $urls}
        <ul class="list--unstyled">
            {foreach $urls as $service => $url}
            <li><a href="{$url}">{translate key="button.login.`$service`"}</a></li>
            {/foreach}
        </ul>
    {/if}
</div>
