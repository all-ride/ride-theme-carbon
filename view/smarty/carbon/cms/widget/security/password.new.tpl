{include 'cms/helper/form.prototype'}

<div class="block" {if isset($app['cms']['widget'])}id="widget-{$app['cms']['widget']}"{/if}>
    <form id="{$form->getId()}" class="form" action="{$app['url']['request']}" method="post" role="form" data-parsley-validate>
        {call formRows form=$form}
        {call formActions submit='button.submit'}
    </form>
</div>
