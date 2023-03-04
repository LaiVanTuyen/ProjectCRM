package paging;

import sort.Sorter;

public interface IPagble {
    Integer getPage();
    Integer getOffset();
    Integer getLimit();
    Sorter getSorter();
}
