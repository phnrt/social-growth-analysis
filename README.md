# social-growth-analysis

## Requirements 

- [Docker](https://docs.docker.com/get-docker/)
- [psql](https://www.timescale.com/blog/how-to-install-psql-on-mac-ubuntu-debian-windows/)

## Run locally

Download the repository

```bash
git clone https://github.com/phnrt/social-growth-analysis.git
cd social-growth-analysis
```

Start the database (this will hold your terminal session)

```bash
docker run -it --rm \
    -p 5432:5432 \
    -e POSTGRES_USER=social-growth-analysis \
    -e POSTGRES_PASSWORD=dev \
    -e PGDATA=/var/lib/postgresql/data/pgdata \
    -v $(pwd)/Postgres:/var/lib/postgresql/data \
    -v $(pwd)/seed.sql:/docker-entrypoint-initdb.d/seed.sql \
    postgres:14
```

In another terminal session, connect to the database

```
psql "postgresql://social-growth-analysis:dev@localhost:5432/social-growth-analysis"
```
## Business Case

![Database UML Diagram](./database-uml.png "Business Case Database UML Diagram")

Given the previous diagram, click on the links to find the queries answering each of the Business Case questions

1. [For the customer with the email address ‘anaberlin83@hotmail.com’, show all the merchant names the customer has transacted with in March 2019.](https://github.com/phnrt/social-growth-analysis/blob/188a45955c631ee9e7e3f78ec79f0b516262b97d/business-case-answers.sql#L3-L11)
   
2. [For every channel category, calculate the average level CACs, per country for conversions in 2019.](https://github.com/phnrt/social-growth-analysis/blob/188a45955c631ee9e7e3f78ec79f0b516262b97d/business-case-answers.sql#L14-L32)
   
3. [Get a list of all customers who had a transaction in the last 2 weeks. For those customers, show the number of transactions they did up to now. (In 1 SQL statement).](https://github.com/phnrt/social-growth-analysis/blob/188a45955c631ee9e7e3f78ec79f0b516262b97d/business-case-answers.sql#L34-L47)
   
4. [How many customers have had at least 2 different products?](https://github.com/phnrt/social-growth-analysis/blob/188a45955c631ee9e7e3f78ec79f0b516262b97d/business-case-answers.sql#L49-L60)
   
5. [From those customers who had at least 2 different products, list the ones who are currently metal and how much time took for them to start the metal subscription (time to upsell)](https://github.com/phnrt/social-growth-analysis/blob/188a45955c631ee9e7e3f78ec79f0b516262b97d/business-case-answers.sql#L62-L88)