{* widget: reiko action: index; translation: widget.reiko *}

{include 'cms/helper/form.prototype'}

<div class="block {$app.cms.properties->getWidgetProperty('style.container')}" id="widget-{$app.cms.widget}">
{if $title}
    <h3>{$title}</h3>
{/if}
    <form action="{$app.url.request}" method="post" role="form" class="form form--inline" data-parsley-validate>
        {call formRows form=$form}
        {call formActions submit='button.subscribe'}
    </form>
</div>
