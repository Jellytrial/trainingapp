# frozen_string_literal: true

module ToppageHelper
  def sort_asc(column_to_be_sorted)
    link_to '▲', { column: column_to_be_sorted, direction: 'asc' }
  end

  def sort_desc(column_to_be_sorted)
    link_to '▼', { column: column_to_be_sorted, direction: 'desc' }
  end

  def sort_direction
    # If params[:direction] is nil, set sort_direction to "desc" by default
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def sort_column
    # If params[:column] is nil, set sort_column to "occurred_date" by default
    Course.column_names.include?(params[:column]) ? params[:column] : 'course_id'
  end
end
