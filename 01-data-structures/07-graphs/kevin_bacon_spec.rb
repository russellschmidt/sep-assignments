include RSpec

require_relative 'kevin_bacon'

RSpec.describe HeapTree, type: Class do
  let (:start_node) { Node.new('Starty McStart', ) }
  let (:bob_roberts) { Node.new("Bob Roberts", ) }
  let (:frank_franklin) {Node.new("Frank Franklin", )}
  let (:julia_goolia) {Node.new("Julia Goolia", )}
  let (:superstar_cinnabuns) {Node.new("Superstar Cinnabuns", )}
  let (:jeff_jeffries) {Node.new("Jeff Jeffries", )}
	let (:rodham_rodsworth) {Node.new("Rodham Rodsworth", )}
	let (:fantastic_sam) {Node.new("Fantastic Sam", )}
	let (:kevin_bacon) {Node.new("Kevin Bacon", )}
end