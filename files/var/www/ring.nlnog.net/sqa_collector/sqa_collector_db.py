USE_MYSQL_TYPES = True
try:
    from . import USE_MYSQL_TYPES
except:
    pass


from sqlalchemy.orm import relationship
from sqlalchemy import Column, ForeignKey
from sqlalchemy.ext.declarative import declarative_base

if USE_MYSQL_TYPES:
    from sqlalchemy.dialects.mysql import INTEGER, DATETIME, VARCHAR, ENUM
else:
    from sqlalchemy import Integer as INTEGER, DateTime as DATETIME, String as VARCHAR, Enum as ENUM

DECLARATIVE_BASE = declarative_base()


class SqaCollector(DECLARATIVE_BASE):

    __tablename__ = 'sqa_collector'
    __table_args__ = (
        {'mysql_engine': 'InnoDB', 'sqlite_autoincrement': True, 'mysql_charset': 'utf8'}
    )

    id = Column(INTEGER, autoincrement=True, primary_key=True, nullable=False)  # pylint: disable=invalid-name
    started = Column(DATETIME, nullable=False)
    ended = Column(DATETIME)
    raised_by = Column(VARCHAR(45), default='unknown', nullable=False)
    afi = Column(ENUM('ipv4','ipv6'), default='ipv4', nullable=False)
    short = Column(VARCHAR(100), nullable=False)

    def __repr__(self):
        return self.__str__()

    def __str__(self):
        return "<SqaCollector(%(id)s)>" % self.__dict__

