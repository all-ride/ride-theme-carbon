{* widget: template; action: index; translation: template.template.images.gallery *}

{include 'cms/helper/assets'}

{$data = isset($app['cms']['context']['content']) ? $app['cms']['context']['content']->data : null}

{if isset($data->media) && $data->getMedia()}
    {call renderAssets assets=$data->getMedia()}
{/if}
