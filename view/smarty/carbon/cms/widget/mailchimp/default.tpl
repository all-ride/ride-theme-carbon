<div class="widget widget-mailchimp-subscribe {if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.container')}{/if}" {if isset($app['cms']['widget'])}id="widget-{$app['cms']['widget']}"{/if}>

    {if $title}
        <h3 class="{if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.title')}{/if}">{$title}</h3>
    {/if}

    {include 'base/form.prototype'}

    <form id="{$form->getId()}" class="form" action="{$app['url']['request']}" method="post" role="form">
        {*{call formWidget form=$form row="email"}*}
        {call formRows form=$form}
        <button type="submit" class="btn" name="subscribe">{'button.subscribe'|translate}</button>
    </form>

</div>
