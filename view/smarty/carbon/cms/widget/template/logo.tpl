{* widget: template; action: index; translation: template.template.logo *}

<a href="{$app['url']['base']}" class="page-header__logo" title="{if isset($app['cms']['context']['title']['site'])}{$app['cms']['context']['title']['site']}{/if}">
    <img src="{$app['url']['base']}/img/svg/logo.svg" alt="Logo" data-url="{$app['url']['base']}/img/svg/fallback/logo.png">
</a>
