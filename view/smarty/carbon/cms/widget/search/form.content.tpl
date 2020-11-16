<div class="block {if isset($app['cms']['properties'])}{$app['cms']['properties']->getWidgetProperty('style.container')}{/if}" {if isset($app['cms']['widget'])}id="widget-{$app.cms.widget}"{/if}>
    <form id="cse-search-box-{$app['cms']['widget']}" action="{$action}" role="search" class="form form--search form--inline" method="post">
        <div class="form__item">
            <label class="visuallyhidden" for="form-search-query-{$app['cms']['widget']}">{'label.query.search'|translate}</label>
            <input type="search" id="form-search-query-{$app['cms']['widget']}" name="query" class="form__text">
        </div>
        <div class="form__actions">
            <button type="submit" class="btn" name="sa">{'button.search'|translate}</button>
        </div>
    </form>
</div>
