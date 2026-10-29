unit ReformaTributaria.Tipos;

interface

uses
  SysUtils, StdCtrls;

type
  { --- ENUM 1: TRATAMENTO DE ALÍQUOTA DO NCM --- }
  TTipoAliquotaReforma = (
    tarPadrao,            // 0 - Alíquota Padrão (Cheia) -> Fator 1.00
    tarZero,              // 1 - Alíquota Zero / Cesta Básica -> Fator 0.00
    tarReduzida60,        // 2 - Alíquota Reduzida em 60% (Paga 40%) -> Fator 0.40
    tarReduzida30,        // 3 - Alíquota Reduzida em 30% (Paga 70%) -> Fator 0.70
    tarIsento,            // 4 - Isento / Imunidade -> Fator 0.00
    tarSuspenso,          // 5 - Suspensão / Diferimento -> Fator 0.00
    tarRegimeEspecifico   // 6 - Monofásico / Combustíveis -> Fator 0.00
  );

  { --- ENUM 2: PERFIL FISCAL DOS ATORES (EMITENTE E DESTINATÁRIO) --- }
  TPerfilFiscalAtor = (
    pfaRegimeRegular,     // 0 - Lucro Real / Presumido (Contribuinte Padrão)
    pfaSimplesNacional,   // 1 - Optante pelo Simples Nacional
    pfaOrgaoPublico,      // 2 - Administração Pública (Direta / Indireta)
    pfaIgrejaTemplos,     // 3 - Templos de Qualquer Culto (Imunidade)
    pfaOngEntidade,       // 4 - Entidades de Assistência Social/Educação sem fins lucrativos
    pfaConsumidorFinalPF  // 5 - Pessoa Física / Não Contribuinte Padrão
  );

  { --- ENUM 3: TIPOS DE CRÉDITO PRESUMIDO DA REFORMA --- }
  TTipoCreditoPresumidoReforma = (
    tcpNenhum,            // 0 - Operação sem direito a crédito presumido
    tcpResiduosReciclagem,// 1 - Aquisição de resíduos e materiais recicláveis
    tcpProdutorRuralPF,   // 2 - Aquisição de produtor rural pessoa física
    tcpCooperadoBens,     // 3 - Operações com cooperados (bens e serviços)
    tcpBensMoveisUsados,  // 4 - Aquisição de veículos e bens móveis usados para revenda
    tcpTransportePassag   // 5 - Serviços integrados de transporte de passageiros
  );

  { --- ESTRUTURAS DE METADADOS (RECORDS) --- }
  TPropriedadesAliquota = record
    Descricao: string;
    FatorCalculo: Double;
  end;

  TPropriedadesPerfil = record
    Descricao: string;
    GeraCreditoB2B: Boolean;
    PossuiImunidadeConstitucional: Boolean;
  end;

  TPropriedadesCreditoPresumido = record
    Descricao: string;
    CodigoOficialFisco: Integer; // Vinculado à tag <cCredPres> do XML
    BaseCalculoSobreMargem: Boolean; // False: Valor total da NF, True: Margem de Lucro
  end;

const
  { --- MATRIZ CONSTANTE: NCM --- }
  PROPRIEDADES_ALIQUOTAS: array[TTipoAliquotaReforma] of TPropriedadesAliquota = (
    (Descricao: 'Alíquota Padrão (Cheia)';        FatorCalculo: 1.00),
    (Descricao: 'Alíquota Zero / Cesta Básica';   FatorCalculo: 0.00),
    (Descricao: 'Alíquota Reduzida em 60%';       FatorCalculo: 0.40),
    (Descricao: 'Alíquota Reduzida em 30%';       FatorCalculo: 0.70),
    (Descricao: 'Isento / Imunidade';             FatorCalculo: 0.00),
    (Descricao: 'Suspensão / Diferimento';        FatorCalculo: 0.00),
    (Descricao: 'Regime Específico (Monofásico)'; FatorCalculo: 0.00)
  );

  { --- MATRIZ CONSTANTE: PERFIS (EMPRESA/CLIENTE) --- }
  PROPRIEDADES_PERFIS: array[TPerfilFiscalAtor] of TPropriedadesPerfil = (
    (Descricao: 'Regime Regular (Real/Presumido)'; GeraCreditoB2B: True;  PossuiImunidadeConstitucional: False),
    (Descricao: 'Simples Nacional';                GeraCreditoB2B: False; PossuiImunidadeConstitucional: False),
    (Descricao: 'Órgão Público';                   GeraCreditoB2B: False; PossuiImunidadeConstitucional: True),
    (Descricao: 'Igrejas / Templos';               GeraCreditoB2B: False; PossuiImunidadeConstitucional: True),
    (Descricao: 'ONG / Entidade Filantrópica';     GeraCreditoB2B: False; PossuiImunidadeConstitucional: True),
    (Descricao: 'Pessoa Física / Consumidor Final';GeraCreditoB2B: False; PossuiImunidadeConstitucional: False)
  );

  { --- MATRIZ CONSTANTE: CRÉDITO PRESUMIDO --- }
  PROPRIEDADES_CREDITOS: array[TTipoCreditoPresumidoReforma] of TPropriedadesCreditoPresumido = (
    (Descricao: 'Não se Aplica';                 CodigoOficialFisco: 0; BaseCalculoSobreMargem: False),
    (Descricao: 'Resíduos e Reciclagem';         CodigoOficialFisco: 1; BaseCalculoSobreMargem: False),
    (Descricao: 'Produtor Rural Pessoa Física';  CodigoOficialFisco: 2; BaseCalculoSobreMargem: False),
    (Descricao: 'Operações com Cooperados';      CodigoOficialFisco: 3; BaseCalculoSobreMargem: False),
    (Descricao: 'Bens Móveis Usados (Veículos)'; CodigoOficialFisco: 4; BaseCalculoSobreMargem: False), // Base = valor pago de aquisição
    (Descricao: 'Transporte de Passageiros';     CodigoOficialFisco: 5; BaseCalculoSobreMargem: False)
  );

{ --- ASSINATURAS DAS FUNÇÕES DE CONVERSÃO E INTERFACE --- }
function AliquotaReformaParaTexto(const ATipo: TTipoAliquotaReforma): string;
function AliquotaReformaParaFator(const ATipo: TTipoAliquotaReforma): Double;
procedure PreencherComboAliquotasReforma(ACombo: TComboBox);

function PerfilAtorParaTexto(const APerfil: TPerfilFiscalAtor): string;
function PerfilPossuiImunidade(const APerfil: TPerfilFiscalAtor): Boolean;
procedure PreencherComboPerfisReforma(ACombo: TComboBox);

function CreditoPresumidoParaTexto(const ATipo: TTipoCreditoPresumidoReforma): string;
function CreditoPresumidoParaCodigoFisco(const ATipo: TTipoCreditoPresumidoReforma): Integer;
function CreditoPresumidoCalculaSobreMargem(const ATipo: TTipoCreditoPresumidoReforma): Boolean;
procedure PreencherComboCreditosPresumidos(ACombo: TComboBox);

implementation

{ --- IMPLEMENTAÇÃO: NCM --- }

function AliquotaReformaParaTexto(const ATipo: TTipoAliquotaReforma): string;
begin
  Result := PROPRIEDADES_ALIQUOTAS[ATipo].Descricao;
end;

function AliquotaReformaParaFator(const ATipo: TTipoAliquotaReforma): Double;
begin
  Result := PROPRIEDADES_ALIQUOTAS[ATipo].FatorCalculo;
end;

procedure PreencherComboAliquotasReforma(ACombo: TComboBox);
var
  i: TTipoAliquotaReforma;
begin
  ACombo.Items.Clear;
  for i := Low(TTipoAliquotaReforma) to High(TTipoAliquotaReforma) do
    ACombo.Items.Add(PROPRIEDADES_ALIQUOTAS[i].Descricao);
end;

{ --- IMPLEMENTAÇÃO: PERFIL ATOR --- }

function PerfilAtorParaTexto(const APerfil: TPerfilFiscalAtor): string;
begin
  Result := PROPRIEDADES_PERFIS[APerfil].Descricao;
end;

function PerfilPossuiImunidade(const APerfil: TPerfilFiscalAtor): Boolean;
begin
  Result := PROPRIEDADES_PERFIS[APerfil].PossuiImunidadeConstitucional;
end;

procedure PreencherComboPerfisReforma(ACombo: TComboBox);
var
  i: TPerfilFiscalAtor;
begin
  ACombo.Items.Clear;
  for i := Low(TPerfilFiscalAtor) to High(TPerfilFiscalAtor) do
    ACombo.Items.Add(PROPRIEDADES_PERFIS[i].Descricao);
end;

{ --- IMPLEMENTAÇÃO: CRÉDITO PRESUMIDO --- }

function CreditoPresumidoParaTexto(const ATipo: TTipoCreditoPresumidoReforma): string;
begin
  Result := PROPRIEDADES_CREDITOS[ATipo].Descricao;
end;

function CreditoPresumidoParaCodigoFisco(const ATipo: TTipoCreditoPresumidoReforma): Integer;
begin
  Result := PROPRIEDADES_CREDITOS[ATipo].CodigoOficialFisco;
end;

function CreditoPresumidoCalculaSobreMargem(const ATipo: TTipoCreditoPresumidoReforma): Boolean;
begin
  Result := PROPRIEDADES_CREDITOS[ATipo].BaseCalculoSobreMargem;
end;

procedure PreencherComboCreditosPresumidos(ACombo: TComboBox);
var
  i: TTipoCreditoPresumidoReforma;
begin
  ACombo.Items.Clear;
  for i := Low(TTipoCreditoPresumidoReforma) to High(TTipoCreditoPresumidoReforma) do
    ACombo.Items.Add(PROPRIEDADES_CREDITOS[i].Descricao);
end;

end.

