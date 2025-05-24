import React from 'react';
import { Check } from 'lucide-react';

type Step = {
  id: string;
  name: string;
  description: string;
};

type CheckoutStepsProps = {
  steps: Step[];
  currentStep: string;
  completedSteps: string[];
};

export const CheckoutSteps: React.FC<CheckoutStepsProps> = ({
  steps,
  currentStep,
  completedSteps,
}) => {
  return (
    <nav aria-label="Progress" className="mb-8">
      <ol className="space-y-4 md:flex md:space-y-0 md:space-x-8">
        {steps.map((step, stepIdx) => {
          const isActive = step.id === currentStep;
          const isCompleted = completedSteps.includes(step.id);
          
          return (
            <li key={step.id} className="md:flex-1">
              <div
                className={`group flex flex-col border-l-4 py-2 pl-4 md:border-l-0 md:border-t-4 md:pb-0 md:pl-0 md:pt-4 ${
                  isActive
                    ? 'border-black text-black md:border-black'
                    : isCompleted
                    ? 'border-green-600 text-green-600 md:border-green-600'
                    : 'border-gray-200 text-gray-400 md:border-gray-200'
                }`}
              >
                <span className="text-sm font-medium">
                  {isCompleted ? (
                    <span className="flex items-center">
                      <Check className="mr-1.5 h-4 w-4 flex-shrink-0" />
                      {step.name}
                    </span>
                  ) : (
                    step.name
                  )}
                </span>
                <span className={`text-sm ${isActive ? 'text-black' : 'text-gray-500'}`}>
                  {step.description}
                </span>
              </div>
            </li>
          );
        })}
      </ol>
    </nav>
  );
};
