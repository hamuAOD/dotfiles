import {
  Actions,
  Context,
  DduEvent,
  DduItem,
  DduOptions,
  Item,
  SourceOptions,
} from "../types.ts";
import { Denops } from "../deps.ts";
import { Loader } from "../loader.ts";

export type BaseSourceParams = Record<string, unknown>;

export type OnInitArguments<Params extends BaseSourceParams> = {
  denops: Denops;
  sourceOptions: SourceOptions;
  sourceParams: Params;
  loader: Loader;
};

export type OnEventArguments<Params extends BaseSourceParams> = {
  denops: Denops;
  sourceOptions: SourceOptions;
  sourceParams: Params;
  event: DduEvent;
};

export type GatherArguments<Params extends BaseSourceParams> = {
  denops: Denops;
  context: Context;
  options: DduOptions;
  sourceOptions: SourceOptions;
  sourceParams: Params;
  input: string;
  parent?: DduItem;
  loader: Loader;
};

export type CheckUpdatedArguments<Params extends BaseSourceParams> = {
  denops: Denops;
  context: Context;
  options: DduOptions;
  sourceOptions: SourceOptions;
  sourceParams: Params;
};

export abstract class BaseSource<
  Params extends BaseSourceParams,
  UserData extends unknown = unknown,
> {
  apiVersion = 3;

  name = "";
  path = "";
  isInitialized = false;

  kind = "base";
  prevMtime = new Date();
  actions: Actions<Params> = {};

  onInit(_args: OnInitArguments<Params>): void | Promise<void> {}

  onEvent(_args: OnEventArguments<Params>): void | Promise<void> {}

  abstract gather(
    {}: GatherArguments<Params>,
  ): ReadableStream<Item<UserData>[]>;

  checkUpdated(
    _args: CheckUpdatedArguments<Params>,
  ): boolean | Promise<boolean> {
    return false;
  }

  abstract params(): Params;
}

export function defaultSourceOptions(): SourceOptions {
  return {
    actions: {},
    columns: [],
    converters: [],
    defaultAction: "",
    ignoreCase: false,
    matcherKey: "word",
    matchers: [],
    maxItems: 10000,
    path: "",
    smartCase: false,
    sorters: [],
    volatile: false,
  };
}
