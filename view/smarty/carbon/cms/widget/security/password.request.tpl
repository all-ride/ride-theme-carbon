{* widget: password; action: request; translation: template.password.request *}

{include 'cms/helper/form.prototype'}

<div class="block" id="widget-{$app.cms.widget}">
    <form id="{$form->getId()}" class="form" action="{$app.url.request}" method="post" role="form" data-parsley-validate>
        {call formRows form=$form}
        {call formActions submit='button.submit'}
    </form>
</div>