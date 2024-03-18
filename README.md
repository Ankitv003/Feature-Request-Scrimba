# Feature Request App

This feature request app is specifically designed for Scrimba, allowing every user on the website to request particular features. The top feature with the most likes will be implemented by the developer on a monthly or quarterly basis. Each month, the features are refreshed, and new features can be requested. To ensure fair participation, the number of feature requests is limited to 5 per month.

## Usage

### Requesting Features

1. Click on "Request a Feature" to begin.
2. Fill in the feature details including a brief description and additional information if needed.
3. Click "Submit" to submit your feature request.

### Voting for Features

- Once features are submitted, users can vote for their favorite features by clicking on the 👍 button. 
- If they don't like a feature, they can also click on the ⛔ button to dislike it.
- Features with the most likes will be given priority for implementation.

## FAQs

### Q.1 What will this be used for?
- Anyone who wants a new feature to the Scrimba website can use it to request features from developers.

### Q.2 How does it work?
- Users fill out a form with details about their idea.

### Q.3 How often are new features implemented?
- New features are implemented on a monthly or quarterly basis, depending on developer availability and project priorities.

### Q.4 Can I change my vote after submitting it?
- No, once a vote is cast, it cannot be changed. Make sure to vote for the features you believe are most important.

### Q.5 Is there a limit to the number of features I can request?
- Yes, to ensure fairness and manageability, the number of feature requests is limited to 5 per month.

### Q.6 How are feature requests prioritized?
- Features with the most likes from the community will be given priority for implementation.

### Q.7 Can I delete or edit my feature request after submission?
- Currently, there is no option to edit or delete feature requests after submission. Please make sure your request is accurate before submitting.

## Code

The core functionality of the app is implemented using Imba.

- `feature-input.imba`: Handles input and submission of feature requests, as well as displaying existing features and their voting options.
- `persist.imba`: Provides functions for persisting data in local storage.
- `main.imba`: Entry point of the application.

## Getting Started

To run the app locally, follow these steps:

1. Clone this repository.
2. Install Imba if you haven't already.
3. Run the application using Imba's development server.

```bash
imba main.imba
