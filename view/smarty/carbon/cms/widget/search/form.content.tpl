<div class="block {$app.cms.properties->getWidgetProperty('style.container')}" id="widget-{$app.cms.widget}">
    <form id="cse-search-box" action="{$action}" role="search" class="form form--inline" method="post">
        <div class="form__item">
            <label class="visuallyhidden" for="form-search-query">{translate key="label.query.search"}</label>
            <input type="search" id="form-search-query" name="query" class="form__text" />
        </div>
        <div class="form__actions">
            <button type="submit" class="btn" name="sa">{translate key="button.search"}</button>
        </div>
    </form>
</div>
