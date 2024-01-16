import {computed} from "vue";

export const formattedDate = computed((artistData) => {
    const isValidDate = /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}.\d{3}Z$/.test(artistData.value.dob);
    if (isValidDate) {
        const date = new Date(artistData.value.dob);
        const formatted = date.toISOString().split('T')[0];
        return formatted;
    } else {
        console.error('Invalid date format:', artistData.value.dob);
        return '';
    }
});