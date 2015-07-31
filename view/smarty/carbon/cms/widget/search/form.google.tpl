<div class="block {$app.cms.properties->getWidgetProperty('style.container')}" id="widget-{$app.cms.widget}">
    <form id="cse-search-box" action="{$action}" role="search" class="form form--inline">
        <input type="hidden" name="cx" value="{$clientId}" />
        <input type="hidden" name="ie" value="UTF-8" />

        <div class="form__item">
            <label class="visuallyhidden" for="form-search-query">{translate key="label.query.search"}</label>
            <input type="search" id="form-search-query" name="q" class="form__text" />
        </div>
        <button type="submit" class="btn" name="sa">{translate key="button.search"}</button>
    </form>
</div>
