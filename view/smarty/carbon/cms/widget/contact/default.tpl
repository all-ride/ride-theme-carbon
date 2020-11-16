{* widget: contact action: index; translation: widget.contact *}

{include 'cms/helper/form.prototype'}

<div class="block {if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.container')}{/if}" {if isset($app['cms']['widget'])}id="widget-{$app['cms']['widget']}"{/if}>
    <p>{'label.fields.required'|translate}</p>
    <form action="{$app['url']['request']}" method="post" role="form" class="form" data-parsley-validate>
        {call formRows form=$form}
        {call formActions submit='button.submit'}
    </form>
</div>
