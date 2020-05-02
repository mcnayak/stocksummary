import {LightningElement, track, wire, api} from 'lwc';
import RapidApiCallout from '@salesforce/apex/RapidApiCallout.ApiRequest';
import { CurrentPageReference } from 'lightning/navigation';
import { getRecord,getFieldValue } from 'lightning/uiRecordApi';

export default class stockApex extends LightningElement {
    @wire(ApiRequest, {url})
    wiredstockSummary ({error, data}) {
    if (error) {
        // TODO: Error handling
    } else if (data) {
        // TODO: Data handling
    }
}
}


