<?php

function smarty_function_addBodyComponent($params, &$smarty) {
    $app = $smarty->getTemplateVars('app');

    $bodyComponent = $app['cms']['node']->get('body.components');

    if ($bodyComponent) {
        $bodyComponents = explode(' ', $bodyComponent);
        $bodyComponents = array_flip($bodyComponents);
    } else {
        $bodyComponents = array();
    }

    $components = explode(' ', $params['component']);
    foreach ($components as $component) {
        $bodyComponents[$component] = true;
    }

    $app['cms']['node']->set('body.components', implode(' ', array_keys($bodyComponents)));
}
