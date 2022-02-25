using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using kitapciRestApi.Models;

namespace kitapciRestApi.Controllers
{
    public class KitaplarController : ApiController
    {
        private KitapciEntities db = new KitapciEntities();

        // GET: api/Kitaplar
        public IQueryable<Kitaplar> GetKitaplar()
        {
            return db.Kitaplar;
        }

        // GET: api/Kitaplar/5
        [ResponseType(typeof(Kitaplar))]
        public IHttpActionResult GetKitaplar(int id)
        {
            Kitaplar kitaplar = db.Kitaplar.Find(id);
            if (kitaplar == null)
            {
                return NotFound();
            }

            return Ok(kitaplar);
        }

        // PUT: api/Kitaplar/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutKitaplar(int id, Kitaplar kitaplar)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != kitaplar.kitapid)
            {
                return BadRequest();
            }

            db.Entry(kitaplar).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!KitaplarExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Kitaplar
        [ResponseType(typeof(Kitaplar))]
        public IHttpActionResult PostKitaplar(Kitaplar kitaplar)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Kitaplar.Add(kitaplar);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = kitaplar.kitapid }, kitaplar);
        }

        // DELETE: api/Kitaplar/5
        [ResponseType(typeof(Kitaplar))]
        public IHttpActionResult DeleteKitaplar(int id)
        {
            Kitaplar kitaplar = db.Kitaplar.Find(id);
            if (kitaplar == null)
            {
                return NotFound();
            }

            db.Kitaplar.Remove(kitaplar);
            db.SaveChanges();

            return Ok(kitaplar);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool KitaplarExists(int id)
        {
            return db.Kitaplar.Count(e => e.kitapid == id) > 0;
        }
    }
}