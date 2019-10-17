defmodule Segment.Analytics.Types do
  @moduledoc false
  def common_fields do
    [
      :anonymousId,
      :context,
      :integrations,
      :timestamp,
      :userId,
      :version
    ]
  end
end

defmodule Segment.Analytics.Track do
  @moduledoc false
  @method "track"
  @derive {AnalyticsFields, only: [:add_properties]}

  defstruct Segment.Analytics.Types.common_fields() ++
              [
                :event,
                :properties,
                type: @method
              ]

  def new(attrs) do
    struct(__MODULE__, attrs)
  end
end

defmodule Segment.Analytics.Identify do
  @moduledoc false
  @method "identify"
  @derive {AnalyticsFields, only: [:add_traits]}

  defstruct Segment.Analytics.Types.common_fields() ++
              [
                :traits,
                type: @method
              ]

  def new(attrs) do
    struct(__MODULE__, attrs)
  end
end

defmodule Segment.Analytics.Alias do
  @moduledoc false
  @method "alias"
  @derive {AnalyticsFields, only: [:add_previous_id]}

  defstruct Segment.Analytics.Types.common_fields() ++
              [
                :previousId,
                type: @method
              ]

  def new(attrs) do
    struct(__MODULE__, attrs)
  end
end

defmodule Segment.Analytics.Page do
  @moduledoc false
  @method "page"
  @derive {AnalyticsFields, only: [:add_properties]}

  defstruct Segment.Analytics.Types.common_fields() ++
              [
                :name,
                :properties,
                type: @method
              ]

  def new(attrs) do
    struct(__MODULE__, attrs)
  end
end

defmodule Segment.Analytics.Screen do
  @moduledoc false
  @method "screen"
  @derive {AnalyticsFields, only: [:add_properties]}

  defstruct Segment.Analytics.Types.common_fields() ++
              [
                :name,
                :properties,
                type: @method
              ]

  def new(attrs) do
    struct(__MODULE__, attrs)
  end
end

defmodule Segment.Analytics.Group do
  @moduledoc false
  @method "group"
  @derive {AnalyticsFields, only: [:add_traits, :add_group_id]}

  defstruct Segment.Analytics.Types.common_fields() ++
              [
                :groupId,
                :traits,
                type: @method
              ]

  def new(attrs) do
    struct(__MODULE__, attrs)
  end
end

defmodule Segment.Analytics.Context do
  @moduledoc false
  @library_name Mix.Project.get().project[:description]
  @library_version Mix.Project.get().project[:version]

  defstruct [
    :active,
    :app,
    :campaign,
    :device,
    :ip,
    :library,
    :locale,
    :location,
    :network,
    :os,
    :page,
    :referrer,
    :screen,
    :timezone,
    :groupId,
    :traits,
    :userAgent
  ]

  def update(context = %__MODULE__{}) do
    %{context | library: %{name: @library_name, version: @library_version}}
  end

  def new do
    update(%__MODULE__{})
  end

  def new(attrs) do
    struct(__MODULE__, attrs)
    |> update
  end
end
