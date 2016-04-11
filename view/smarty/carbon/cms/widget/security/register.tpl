<div class="block {$app.cms.properties->getWidgetProperty('style.container')}" id="widget-{$app.cms.widget}">
    {include 'base/form.prototype'}

    <form id="{$form->getId()}" class="form" action="{$app.url.request}" method="post" role="form">
        <div class="form__group">
            {call formRows form=$form}
            {call formActions submit='button.register'}
        </div>
    </form>
</div>
