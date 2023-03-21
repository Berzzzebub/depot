import React from 'react'
import ReactDOM from 'react-dom/client'
import PayTypeSelector from "../PayTypeSelector"

document.addEventListener('turbolinks:load', function () {
    let element = document.getElementById("pay-type-component");
    const root = ReactDOM.createRoot(element);
    root.render(<PayTypeSelector/>);
});