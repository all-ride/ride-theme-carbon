<div class="block {if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.container')}{/if}" {if isset($app['cms']['widget'])}id="widget-{$app.cms.widget}"{/if}>
    <form id="cse-search-box-{$app['cms']['widget']}" action="{$action}" role="search" class="form form--search form--inline">
        <input type="hidden" name="cx" value="{$clientId}">
        <input type="hidden" name="ie" value="UTF-8">
        <div class="form__item">
            <label class="visuallyhidden" for="form-search-query-{$app['cms']['widget']}">{'label.query.search'|translate}</label>
            <input type="search" id="form-search-query-{$app['cms']['widget']}" name="q" class="form__text">
        </div>
        <button type="submit" class="btn" name="sa">{'button.search'|translate}</button>
    </form>
</div>
