rng(1);

%numbers of examples in the two classes
numEx0 = 500;       %minority class
numEx1 = 10000;     %majority class

%class centers
center0 = [2.5 2.5];
center1 = [3 3];

%class standard deviations:
%anisotropic Guassian as minority class best illustrates the effect of
%setting adasyn_featuresAreNormalized (cf. below) true resp. false:
stds0 = [0.1 0.4];
stds1 = [0.2 0.2];

%class labels:
labels0 = false([numEx0 1]);
labels1 = true ([numEx1 1]);

features0 = [...
    center0(1) + randn([numEx0 1])*stds0(1)...
    center0(2) + randn([numEx0 1])*stds0(2)...
    ];
features1 = [...
    center1(1) + randn([numEx1 1])*stds1(1)...
    center1(2) + randn([numEx1 1])*stds1(2)...
    ];

SMOTE_features = SMOTE(features0, 19, 25);


% PLOTTING:

%plot input data:
figure;
hold on;
plot(features0(:,1), features0(:,2), 'r.');
plot(features1(:,1), features1(:,2), 'b.');
title('input point sets');
legend({['minority class (' num2str(numEx0) ' examples)'] ['majority class (' num2str(numEx1) ' examples)']});
xlabel('feature_1');
ylabel('feature_2');
axis('equal');
hold off;

%plot synthesized examples in green:
figure;
hold on;
plot(SMOTE_features(:,1), SMOTE_features(:,2), 'g.');
plot(features0(:,1), features0(:,2), 'r.');
plot(features1(:,1), features1(:,2), 'b.');
title('input point sets and synthetic points generated bySMOTE');
legend({['synthetic minority class (' num2str(size(SMOTE_features,1)) ' examples)'] ['minority class (' num2str(numEx0) ' examples)'] ['majority class (' num2str(numEx1) ' examples)']});
xlabel('feature_1');
ylabel('feature_2');
axis('equal');
hold off;
