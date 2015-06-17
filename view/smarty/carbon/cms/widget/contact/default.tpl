{* widget: contact action: index; translation: widget.contact *}

{include file="cms/helper/form.prototype"}

<div class="widget widget-contact block {$app.cms.properties->getWidgetProperty('style.container')}" id="widget-{$app.cms.widget}">
    <form action="{$app.url.request}" method="post" role="form" class="form" data-parsley-validate>
        {call formRows form=$form}

        {call formActions submit="button.submit"}
    </form>
</div>
