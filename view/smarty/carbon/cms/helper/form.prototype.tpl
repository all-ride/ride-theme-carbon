{include file="base/form.prototype" inline}

{$bodyComponent = $app.cms.node->get('body.components')}
{if !$bodyComponent|strstr:'form'}
    {$app.cms.node->set('body.components', "`$bodyComponent` form")}
{/if}
