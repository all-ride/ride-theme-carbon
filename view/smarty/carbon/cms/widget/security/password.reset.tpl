{* widget: password; action: reset; translation: template.password.reset *}

{include 'base/form.prototype'}

<div class="block" id="widget-{$app.cms.widget}">
    <form id="{$form->getId()}" class="form" action="{$app.url.request}" method="post" role="form">
        <div class="form__group">
            {call formRow form=$form row='user'}
            {call formActions submit='button.submit'}
        </div>
    </form>
</div>
