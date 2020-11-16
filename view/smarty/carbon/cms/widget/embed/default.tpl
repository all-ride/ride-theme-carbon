{* widget: embed; action: index; translation: widget.embed *}

<div class="block" {if isset($app['cms']['widget'])}id="widget-{$app['cms']['widget']}"{/if}>
    {$embed}
</div>
