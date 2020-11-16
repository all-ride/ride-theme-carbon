<div class="block {if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.container')}{/if}" {if isset($app['cms']['widget'])}id="widget-{$app.cms.widget}"{/if}>
    {include 'base/form.prototype'}

    <form id="{$form->getId()}" class="form" action="{$app['url']['request']}" method="post" role="form">
        <div class="form__group">
            {call formRows form=$form}
            {call formActions submit='button.register'}
        </div>
    </form>
</div>
