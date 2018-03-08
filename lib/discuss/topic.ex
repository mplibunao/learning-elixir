def Discuss.Topic do
  use Discuss.Web, :model

  schema "topics" do
    field :title, :string
  end

  def changeset(struct, params \\ %{}) do
    struct
    # Takes the params and produces a changeset (data we're trying to put)
    |> cast(params, [:title])
    # Passes the changeset to one or more validation functions
    |> validate_required([:title])
  end
end
