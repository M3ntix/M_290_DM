// DOM-Elemente auswählen
const menuPlanForm = document.getElementById("menuPlanForm");
const weekStartDateInput = document.getElementById("weekStartDate");
const budgetInput = document.getElementById("budget");
const menuPlansContainer = document.getElementById("menuPlans");

// Eventlistener für Formular zum Erstellen eines Menüplans hinzufügen
menuPlanForm.addEventListener("submit", function (event) {
    event.preventDefault();

    // Daten aus dem Formular abrufen
    const weekStartDate = weekStartDateInput.value;
    const budget = budgetInput.value;

    // Senden Sie die Daten an das Backend (hier nehmen wir an, dass Sie eine API-URL haben)
    fetch("/api/menu_plans", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({ weekStartDate, budget }),
    })
        .then((response) => response.json())
        .then((newMenuPlan) => {
            // Neuen Menüplan zur Anzeige hinzufügen
            const menuPlanElement = document.createElement("div");
            menuPlanElement.textContent = `Woche ab ${newMenuPlan.week_start_date}, Budget: ${newMenuPlan.budget}`;
            menuPlansContainer.appendChild(menuPlanElement);

            // Formular zurücksetzen
            weekStartDateInput.value = "";
            budgetInput.value = "";
        })
        .catch((error) => {
            console.error("Fehler beim Erstellen des Menüplans:", error);
        });
});

// Lade vorhandene Menüpläne beim Laden der Seite
fetch("/api/menu_plans")
    .then((response) => response.json())
    .then((menuPlans) => {
        // Menüpläne in der Anzeige anzeigen
        menuPlans.forEach((menuPlan) => {
            const menuPlanElement = document.createElement("div");
            menuPlanElement.textContent = `Woche ab ${menuPlan.week_start_date}, Budget: ${menuPlan.budget}`;
            menuPlansContainer.appendChild(menuPlanElement);
        });
    })
    .catch((error) => {
        console.error("Fehler beim Laden der Menüpläne:", error);
    });
